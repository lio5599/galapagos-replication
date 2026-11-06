; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_5.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %w = alloca i32, align 4
  %v = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  %and = and i32 %0, 65535
  store i32 %and, ptr %w, align 4
  %1 = load i32, ptr %w, align 4
  %cmp = icmp uge i32 %1, 65280
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, ptr %w, align 4
  %and1 = and i32 %2, 255
  %cmp2 = icmp eq i32 %and1, 47
  %conv = zext i1 %cmp2 to i32
  %sub = sub i32 63, %conv
  store i32 %sub, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, ptr %w, align 4
  %cmp3 = icmp ugt i32 %3, 255
  br i1 %cmp3, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  store i32 255, ptr %retval, align 4
  br label %return

if.end6:                                          ; preds = %if.end
  %4 = load i32, ptr %w, align 4
  %cmp7 = icmp uge i32 %4, 65
  br i1 %cmp7, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %if.end6
  %5 = load i32, ptr %w, align 4
  %cmp9 = icmp ule i32 %5, 90
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %6 = load i32, ptr %w, align 4
  %sub11 = sub nsw i32 %6, 65
  br label %cond.end38

cond.false:                                       ; preds = %land.lhs.true, %if.end6
  %7 = load i32, ptr %w, align 4
  %cmp12 = icmp uge i32 %7, 97
  br i1 %cmp12, label %land.lhs.true14, label %cond.false19

land.lhs.true14:                                  ; preds = %cond.false
  %8 = load i32, ptr %w, align 4
  %cmp15 = icmp ule i32 %8, 122
  br i1 %cmp15, label %cond.true17, label %cond.false19

cond.true17:                                      ; preds = %land.lhs.true14
  %9 = load i32, ptr %w, align 4
  %sub18 = sub nsw i32 %9, 71
  br label %cond.end36

cond.false19:                                     ; preds = %land.lhs.true14, %cond.false
  %10 = load i32, ptr %w, align 4
  %cmp20 = icmp uge i32 %10, 48
  br i1 %cmp20, label %land.lhs.true22, label %cond.false26

land.lhs.true22:                                  ; preds = %cond.false19
  %11 = load i32, ptr %w, align 4
  %cmp23 = icmp ule i32 %11, 57
  br i1 %cmp23, label %cond.true25, label %cond.false26

cond.true25:                                      ; preds = %land.lhs.true22
  %12 = load i32, ptr %w, align 4
  %add = add nsw i32 %12, 4
  br label %cond.end34

cond.false26:                                     ; preds = %land.lhs.true22, %cond.false19
  %13 = load i32, ptr %w, align 4
  %cmp27 = icmp eq i32 %13, 43
  br i1 %cmp27, label %cond.true29, label %cond.false30

cond.true29:                                      ; preds = %cond.false26
  br label %cond.end

cond.false30:                                     ; preds = %cond.false26
  %14 = load i32, ptr %w, align 4
  %cmp31 = icmp eq i32 %14, 47
  %15 = zext i1 %cmp31 to i64
  %cond = select i1 %cmp31, i32 63, i32 -1
  br label %cond.end

cond.end:                                         ; preds = %cond.false30, %cond.true29
  %cond33 = phi i32 [ 62, %cond.true29 ], [ %cond, %cond.false30 ]
  br label %cond.end34

cond.end34:                                       ; preds = %cond.end, %cond.true25
  %cond35 = phi i32 [ %add, %cond.true25 ], [ %cond33, %cond.end ]
  br label %cond.end36

cond.end36:                                       ; preds = %cond.end34, %cond.true17
  %cond37 = phi i32 [ %sub18, %cond.true17 ], [ %cond35, %cond.end34 ]
  br label %cond.end38

cond.end38:                                       ; preds = %cond.end36, %cond.true
  %cond39 = phi i32 [ %sub11, %cond.true ], [ %cond37, %cond.end36 ]
  store i32 %cond39, ptr %v, align 4
  %16 = load i32, ptr %v, align 4
  %cmp40 = icmp slt i32 %16, 0
  br i1 %cmp40, label %cond.true42, label %cond.false43

cond.true42:                                      ; preds = %cond.end38
  br label %cond.end44

cond.false43:                                     ; preds = %cond.end38
  %17 = load i32, ptr %v, align 4
  br label %cond.end44

cond.end44:                                       ; preds = %cond.false43, %cond.true42
  %cond45 = phi i32 [ 255, %cond.true42 ], [ %17, %cond.false43 ]
  store i32 %cond45, ptr %retval, align 4
  br label %return

return:                                           ; preds = %cond.end44, %if.then5, %if.then
  %18 = load i32, ptr %retval, align 4
  ret i32 %18
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
