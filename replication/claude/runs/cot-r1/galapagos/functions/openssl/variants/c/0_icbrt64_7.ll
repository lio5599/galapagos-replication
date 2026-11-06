; ModuleID = '/home/liolsen/galapagos-replication/functions/openssl/variants/c/0_icbrt64_7.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/openssl/variants/c/0_icbrt64_7.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i64 @icbrt64(i64 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @icbrt64(i64 noundef %x) #0 {
entry:
  %retval = alloca i64, align 8
  %x.addr = alloca i64, align 8
  %t = alloca i64, align 8
  %y = alloca i64, align 8
  %y1 = alloca i64, align 8
  %n = alloca i32, align 4
  store i64 %x, ptr %x.addr, align 8
  %0 = load i64, ptr %x.addr, align 8
  store i64 %0, ptr %t, align 8
  store i32 0, ptr %n, align 4
  %1 = load i64, ptr %x.addr, align 8
  %cmp = icmp eq i64 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 0, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end
  %2 = load i64, ptr %t, align 8
  %tobool = icmp ne i64 %2, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load i32, ptr %n, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, ptr %n, align 4
  %4 = load i64, ptr %t, align 8
  %shr = lshr i64 %4, 1
  store i64 %shr, ptr %t, align 8
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %5 = load i32, ptr %n, align 4
  %add = add nsw i32 %5, 2
  %div = sdiv i32 %add, 3
  %sh_prom = zext i32 %div to i64
  %shl = shl i64 1, %sh_prom
  store i64 %shl, ptr %y, align 8
  br label %for.cond

for.cond:                                         ; preds = %if.end7, %while.end
  %6 = load i64, ptr %y, align 8
  %mul = mul i64 2, %6
  %7 = load i64, ptr %x.addr, align 8
  %8 = load i64, ptr %y, align 8
  %9 = load i64, ptr %y, align 8
  %mul1 = mul i64 %8, %9
  %div2 = udiv i64 %7, %mul1
  %add3 = add i64 %mul, %div2
  %div4 = udiv i64 %add3, 3
  store i64 %div4, ptr %y1, align 8
  %10 = load i64, ptr %y1, align 8
  %11 = load i64, ptr %y, align 8
  %cmp5 = icmp uge i64 %10, %11
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %for.cond
  br label %for.end

if.end7:                                          ; preds = %for.cond
  %12 = load i64, ptr %y1, align 8
  store i64 %12, ptr %y, align 8
  br label %for.cond

for.end:                                          ; preds = %if.then6
  %13 = load i64, ptr %y, align 8
  %shl8 = shl i64 %13, 12
  store i64 %shl8, ptr %retval, align 8
  br label %return

return:                                           ; preds = %for.end, %if.then
  %14 = load i64, ptr %retval, align 8
  ret i64 %14
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
