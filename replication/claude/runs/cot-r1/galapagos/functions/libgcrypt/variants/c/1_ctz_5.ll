; ModuleID = '/home/liolsen/galapagos-replication/functions/libgcrypt/variants/c/1_ctz_5.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libgcrypt/variants/c/1_ctz_5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@ctz.t = internal global [64 x i8] zeroinitializer, align 16
@ctz.init = internal global i32 0, align 4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ctz(i64 noundef %in) #0 {
entry:
  %retval = alloca i32, align 4
  %in.addr = alloca i64, align 8
  %i = alloca i32, align 4
  store i64 %in, ptr %in.addr, align 8
  %0 = load i32, ptr @ctz.init, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %1, 64
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, ptr %i, align 4
  %conv = trunc i32 %2 to i8
  %3 = load i32, ptr %i, align 4
  %sh_prom = zext i32 %3 to i64
  %shl = shl i64 1, %sh_prom
  %mul = mul i64 %shl, 285870213051386505
  %shr = lshr i64 %mul, 58
  %arrayidx = getelementptr inbounds [64 x i8], ptr @ctz.t, i64 0, i64 %shr
  store i8 %conv, ptr %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32, ptr %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  store i32 1, ptr @ctz.init, align 4
  br label %if.end

if.end:                                           ; preds = %for.end, %entry
  %5 = load i64, ptr %in.addr, align 8
  %cmp1 = icmp eq i64 %5, 0
  br i1 %cmp1, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  store i32 64, ptr %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %6 = load i64, ptr %in.addr, align 8
  %7 = load i64, ptr %in.addr, align 8
  %sub = sub i64 0, %7
  %and = and i64 %6, %sub
  %mul5 = mul i64 %and, 285870213051386505
  %shr6 = lshr i64 %mul5, 58
  %arrayidx7 = getelementptr inbounds [64 x i8], ptr @ctz.t, i64 0, i64 %shr6
  %8 = load i8, ptr %arrayidx7, align 1
  %conv8 = zext i8 %8 to i32
  store i32 %conv8, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end4, %if.then3
  %9 = load i32, ptr %retval, align 4
  ret i32 %9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @ctz(i64 noundef 0)
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
