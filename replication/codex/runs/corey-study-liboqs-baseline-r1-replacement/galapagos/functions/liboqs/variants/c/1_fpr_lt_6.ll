; ModuleID = '/home/cbhei/galapagos-corey-runs/corey-study-liboqs-baseline-r1-replacement/functions/liboqs/variants/c/1_fpr_lt_6.bc'
source_filename = "/home/cbhei/galapagos-corey-runs/corey-study-liboqs-baseline-r1-replacement/functions/liboqs/variants/c/1_fpr_lt_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fpr_lt(i64 noundef %x, i64 noundef %y) #0 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %sign = alloca i64, align 8
  store i64 %x, ptr %x.addr, align 8
  store i64 %y, ptr %y.addr, align 8
  store i64 -9223372036854775808, ptr %sign, align 8
  %0 = load i64, ptr %x.addr, align 8
  %and = and i64 %0, -9223372036854775808
  %tobool = icmp ne i64 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i64, ptr %y.addr, align 8
  %and1 = and i64 %1, -9223372036854775808
  %tobool2 = icmp ne i64 %and1, 0
  br i1 %tobool2, label %lor.rhs, label %lor.end

lor.rhs:                                          ; preds = %if.then
  %2 = load i64, ptr %x.addr, align 8
  %3 = load i64, ptr %y.addr, align 8
  %cmp = icmp ugt i64 %2, %3
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.then
  %4 = phi i1 [ true, %if.then ], [ %cmp, %lor.rhs ]
  %lor.ext = zext i1 %4 to i32
  store i32 %lor.ext, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %5 = load i64, ptr %y.addr, align 8
  %and3 = and i64 %5, -9223372036854775808
  %tobool4 = icmp ne i64 %and3, 0
  br i1 %tobool4, label %land.end, label %land.rhs

land.rhs:                                         ; preds = %if.end
  %6 = load i64, ptr %x.addr, align 8
  %7 = load i64, ptr %y.addr, align 8
  %cmp5 = icmp ult i64 %6, %7
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end
  %8 = phi i1 [ false, %if.end ], [ %cmp5, %land.rhs ]
  %land.ext = zext i1 %8 to i32
  store i32 %land.ext, ptr %retval, align 4
  br label %return

return:                                           ; preds = %land.end, %lor.end
  %9 = load i32, ptr %retval, align 4
  ret i32 %9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @fpr_lt(i64 noundef 0, i64 noundef 0)
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
