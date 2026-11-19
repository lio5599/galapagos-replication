; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-liboqs-baseline-r1/functions/liboqs/variants/c/1_fpr_lt_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-liboqs-baseline-r1/functions/liboqs/variants/c/1_fpr_lt_8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fpr_lt(i64 noundef %x, i64 noundef %y) #0 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %hx = alloca i32, align 4
  %hy = alloca i32, align 4
  %lx = alloca i32, align 4
  %ly = alloca i32, align 4
  store i64 %x, ptr %x.addr, align 8
  store i64 %y, ptr %y.addr, align 8
  %0 = load i64, ptr %x.addr, align 8
  %shr = lshr i64 %0, 32
  %conv = trunc i64 %shr to i32
  store i32 %conv, ptr %hx, align 4
  %1 = load i64, ptr %y.addr, align 8
  %shr1 = lshr i64 %1, 32
  %conv2 = trunc i64 %shr1 to i32
  store i32 %conv2, ptr %hy, align 4
  %2 = load i64, ptr %x.addr, align 8
  %conv3 = trunc i64 %2 to i32
  store i32 %conv3, ptr %lx, align 4
  %3 = load i64, ptr %y.addr, align 8
  %conv4 = trunc i64 %3 to i32
  store i32 %conv4, ptr %ly, align 4
  %4 = load i32, ptr %hx, align 4
  %shr5 = lshr i32 %4, 31
  %5 = load i32, ptr %hy, align 4
  %shr6 = lshr i32 %5, 31
  %cmp = icmp ne i32 %shr5, %shr6
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %6 = load i32, ptr %hx, align 4
  %shr8 = lshr i32 %6, 31
  store i32 %shr8, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %7 = load i32, ptr %hx, align 4
  %shr9 = lshr i32 %7, 31
  %tobool = icmp ne i32 %shr9, 0
  br i1 %tobool, label %if.then10, label %if.end17

if.then10:                                        ; preds = %if.end
  %8 = load i32, ptr %hx, align 4
  %9 = load i32, ptr %hy, align 4
  %cmp11 = icmp ugt i32 %8, %9
  br i1 %cmp11, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.then10
  %10 = load i32, ptr %hx, align 4
  %11 = load i32, ptr %hy, align 4
  %cmp13 = icmp eq i32 %10, %11
  br i1 %cmp13, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.rhs
  %12 = load i32, ptr %lx, align 4
  %13 = load i32, ptr %ly, align 4
  %cmp15 = icmp ugt i32 %12, %13
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs
  %14 = phi i1 [ false, %lor.rhs ], [ %cmp15, %land.rhs ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %if.then10
  %15 = phi i1 [ true, %if.then10 ], [ %14, %land.end ]
  %lor.ext = zext i1 %15 to i32
  store i32 %lor.ext, ptr %retval, align 4
  br label %return

if.end17:                                         ; preds = %if.end
  %16 = load i32, ptr %hx, align 4
  %17 = load i32, ptr %hy, align 4
  %cmp18 = icmp ult i32 %16, %17
  br i1 %cmp18, label %lor.end27, label %lor.rhs20

lor.rhs20:                                        ; preds = %if.end17
  %18 = load i32, ptr %hx, align 4
  %19 = load i32, ptr %hy, align 4
  %cmp21 = icmp eq i32 %18, %19
  br i1 %cmp21, label %land.rhs23, label %land.end26

land.rhs23:                                       ; preds = %lor.rhs20
  %20 = load i32, ptr %lx, align 4
  %21 = load i32, ptr %ly, align 4
  %cmp24 = icmp ult i32 %20, %21
  br label %land.end26

land.end26:                                       ; preds = %land.rhs23, %lor.rhs20
  %22 = phi i1 [ false, %lor.rhs20 ], [ %cmp24, %land.rhs23 ]
  br label %lor.end27

lor.end27:                                        ; preds = %land.end26, %if.end17
  %23 = phi i1 [ true, %if.end17 ], [ %22, %land.end26 ]
  %lor.ext28 = zext i1 %23 to i32
  store i32 %lor.ext28, ptr %retval, align 4
  br label %return

return:                                           ; preds = %lor.end27, %lor.end, %if.then
  %24 = load i32, ptr %retval, align 4
  ret i32 %24
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
