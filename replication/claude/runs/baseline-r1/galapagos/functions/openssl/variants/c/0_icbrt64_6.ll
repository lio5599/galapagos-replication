; ModuleID = '/home/liolsen/galapagos-replication/functions/openssl/variants/c/0_icbrt64_6.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/openssl/variants/c/0_icbrt64_6.c"
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
  %y = alloca i64, align 8
  %t = alloca i64, align 8
  store i64 %x, ptr %x.addr, align 8
  %0 = load i64, ptr %x.addr, align 8
  %cmp = icmp eq i64 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 0, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  store i64 2642245, ptr %y, align 8
  br label %for.cond

for.cond:                                         ; preds = %if.end5, %if.end
  %1 = load i64, ptr %y, align 8
  %mul = mul i64 2, %1
  %2 = load i64, ptr %x.addr, align 8
  %3 = load i64, ptr %y, align 8
  %4 = load i64, ptr %y, align 8
  %mul1 = mul i64 %3, %4
  %div = udiv i64 %2, %mul1
  %add = add i64 %mul, %div
  %div2 = udiv i64 %add, 3
  store i64 %div2, ptr %t, align 8
  %5 = load i64, ptr %t, align 8
  %6 = load i64, ptr %y, align 8
  %cmp3 = icmp uge i64 %5, %6
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %for.cond
  br label %for.end

if.end5:                                          ; preds = %for.cond
  %7 = load i64, ptr %t, align 8
  store i64 %7, ptr %y, align 8
  br label %for.cond

for.end:                                          ; preds = %if.then4
  %8 = load i64, ptr %y, align 8
  %shl = shl i64 %8, 12
  store i64 %shl, ptr %retval, align 8
  br label %return

return:                                           ; preds = %for.end, %if.then
  %9 = load i64, ptr %retval, align 8
  ret i64 %9
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
