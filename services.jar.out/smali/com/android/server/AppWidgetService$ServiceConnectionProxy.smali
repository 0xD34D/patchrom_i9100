.class Lcom/android/server/AppWidgetService$ServiceConnectionProxy;
.super Ljava/lang/Object;
.source "AppWidgetService.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/AppWidgetService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ServiceConnectionProxy"
.end annotation


# instance fields
.field private final mConnectionCb:Landroid/os/IBinder;

.field private final mKey:Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/Integer;",
            "Landroid/content/Intent$FilterComparison;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/util/Pair;Landroid/os/IBinder;)V
    .locals 0
    .parameter
    .parameter "connectionCb"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/Integer;",
            "Landroid/content/Intent$FilterComparison;",
            ">;",
            "Landroid/os/IBinder;",
            ")V"
        }
    .end annotation

    .prologue
    .line 147
    .local p1, key:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Landroid/content/Intent$FilterComparison;>;"
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 148
    iput-object p1, p0, Lcom/android/server/AppWidgetService$ServiceConnectionProxy;->mKey:Landroid/util/Pair;

    .line 149
    iput-object p2, p0, Lcom/android/server/AppWidgetService$ServiceConnectionProxy;->mConnectionCb:Landroid/os/IBinder;

    .line 150
    return-void
.end method


# virtual methods
.method public disconnect()V
    .locals 3

    .prologue
    .line 164
    iget-object v2, p0, Lcom/android/server/AppWidgetService$ServiceConnectionProxy;->mConnectionCb:Landroid/os/IBinder;

    invoke-static {v2}, Lcom/android/internal/widget/IRemoteViewsAdapterConnection$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/widget/IRemoteViewsAdapterConnection;

    move-result-object v0

    .line 167
    .local v0, cb:Lcom/android/internal/widget/IRemoteViewsAdapterConnection;
    :try_start_0
    invoke-interface {v0}, Lcom/android/internal/widget/IRemoteViewsAdapterConnection;->onServiceDisconnected()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 171
    :goto_0
    return-void

    .line 168
    :catch_0
    move-exception v1

    .line 169
    .local v1, e:Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 3
    .parameter "name"
    .parameter "service"

    .prologue
    .line 152
    iget-object v2, p0, Lcom/android/server/AppWidgetService$ServiceConnectionProxy;->mConnectionCb:Landroid/os/IBinder;

    invoke-static {v2}, Lcom/android/internal/widget/IRemoteViewsAdapterConnection$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/widget/IRemoteViewsAdapterConnection;

    move-result-object v0

    .line 155
    .local v0, cb:Lcom/android/internal/widget/IRemoteViewsAdapterConnection;
    :try_start_0
    invoke-interface {v0, p2}, Lcom/android/internal/widget/IRemoteViewsAdapterConnection;->onServiceConnected(Landroid/os/IBinder;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 159
    :goto_0
    return-void

    .line 156
    :catch_0
    move-exception v1

    .line 157
    .local v1, e:Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 0
    .parameter "name"

    .prologue
    .line 161
    invoke-virtual {p0}, Lcom/android/server/AppWidgetService$ServiceConnectionProxy;->disconnect()V

    .line 162
    return-void
.end method
